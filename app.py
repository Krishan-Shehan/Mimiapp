
# from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask import Flask,request,jsonify

# from firebase import Firebase

from pydub import AudioSegment
from pydub.utils import make_chunks 
from pydub.silence import split_on_silence
import librosa
import numpy as np
from pydub import AudioSegment
from google.cloud.speech_v1.types.cloud_speech import SpeechContext
import argparse
import io
import math
import wave
import json
from google.oauth2 import service_account
# from google.cloud import speech
from itertools import chain
import ast
import pandas as pd
from sklearn.model_selection import train_test_split
from keras.models import load_model
import os

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///example.sqlite"
db = SQLAlchemy(app)

class Users(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(120), unique=True, nullable=False)
    email = db.Column(db.String(120))
    password = db.Column(db.String(80))

# with app.app_context():
#     db.create_all()
#     db.session.add(Users(username="examp6",email="email",password="password"))
#     db.session.commit()
#     users = db.session.execute(db.select(Users)).scalars() 

@app.route("/typeidf",methods=["POST"])
def typeidf():
    if request.method == "POST":
        audio_file = request.files["file"]
        file_name = "Test98.wav" 
        audio_file.save(file_name)

        # x = transcribe_file_with_word_time_offsets('file_name','si-LK')
        x = transcribe_file_with_word_time_offsets('test_sen.wav','si-LK')
        y = stutter_severity(x)
        # return jsonify(["success","gg"])
        return jsonify('success',y)

        

test_result = []
sum_of_durations = []
start_time_global = []
end_time_global = []
credentials = service_account.Credentials.from_service_account_file('xentrix1-b49eb74fd188.json')
test_result_spaces_removed = []
new_word_list = []


def transcribe_file_with_word_time_offsets(speech_file,language):

    """Transcribe the given audio file synchronously and output the word time
    offsets."""
    # print("Start")

    from google.cloud import speech

    # print("checking credentials")
      
    client = speech.SpeechClient(credentials=credentials)
    
    # print("Checked")
    with io.open(speech_file, 'rb') as audio_file:
        content = audio_file.read()
              
    # print("audio file read")    
    
    audio = speech.RecognitionAudio(content=content)
    
    with open('boost.json', encoding="utf-8") as f:
              data = json.load(f)

    # print("config start")
    config = speech.RecognitionConfig(
            encoding= speech.RecognitionConfig.AudioEncoding.LINEAR16,
            language_code=language,
            speech_contexts =  data,
            enable_word_time_offsets=True,
            # audio_channel_count = 2,
            )
  
    # print("Recognizing:")

    response=client.recognize(config=config, audio=audio)
    # print("Recognized")
    # return response
    for result in response.results:
      
      tot_dur = []
      start_time_list = []
      end_time_list = []

      alternative = result.alternatives[0]
      print('Transcript:{}'.format(alternative.transcript))
      test_result.append(alternative.transcript)
      
      
      for word_info in alternative.words:
        word = word_info.word
        start_time = word_info.start_time
        end_time = word_info.end_time
        duration = float(str((end_time.seconds + end_time.microseconds * 1e-9) - (start_time.seconds + start_time.microseconds * 1e-9)))
            
        print('Word:{}, start_time: {}, end_time: {}, duration: {}'.format(word,
                  start_time.seconds + start_time.microseconds * 1e-9,
                  end_time.seconds + end_time.microseconds * 1e-9,
                  duration))
        start_time_list.append(start_time.seconds + start_time.microseconds * 1e-9)
        end_time_list.append(end_time.seconds + end_time.microseconds * 1e-9)

        # times between which to extract the wave from
        start = start_time_list[0] # seconds
        # end = end_time_global[len(end_time_global) -1]
        end = math.ceil(end_time_list[(len(end_time_list) -1)])

        # file to extract the snippet from
        with wave.open(speech_file, "rb") as infile:
                    # get file data
          nchannels = infile.getnchannels()
          sampwidth = infile.getsampwidth()
          framerate = infile.getframerate()
          
                    # set position in wave to start of segment
          infile.setpos(int(start * framerate))
                    # extract data
          data = infile.readframes(int((end - start) * framerate))

            # write the extracted data to a new file
      output_file =(word+'.wav') 

      with wave.open(output_file, "w") as outfile:
        outfile.setnchannels(nchannels)
        outfile.setsampwidth(sampwidth)
        outfile.setframerate(framerate)
        outfile.setnframes(int(len(data) / sampwidth))
        outfile.writeframes(data)
        outfile.close()

    print(test_result)
    mylist = test_result
    result = list(chain.from_iterable(map(str.split, mylist)))
    print(result)
    

    for x in test_result:
        string = x
        test_result_spaces_removed.append(remove(string))
        test_result_spaces_removed

    print("removed text : " ,test_result_spaces_removed)
    with open('corpus.txt', 'r',encoding="utf8") as f:
        list_1 = f.readline()
    
    # initializing string representation of a list
    ini_list = list_1

    # Converting string to list
    res_list = ast.literal_eval(ini_list)

    word_identification_and_block_merge(res_list)
    
    for sublist in words_list:
        for food in sublist:
            new_word_list.append(food)

    print(new_word_list)

    for i in new_word_list:
        word = feature_extraction(str(i)+".wav")
        p,b,m,s,ns=predict_type_phase1(word)
        print(ns)
        s_type=predict_type(p,b,m,s,ns,word)
        print("Type : ",s_type)
        print(str(i)+".wav")
        print(p,b,m,s,ns)
        type_list.append(s_type)

    print(type_list)
    return(type_list)
    
type_list = []
words_list = []

def remove(string):
    return string.replace(" ", "")

def word_identification_and_block_merge(res_list):

    # initializing list
    test_list = test_result_spaces_removed
   
    # using list comprehension
    # consecutive element pairing 
    res = [[test_list[i], test_list[i + 1]]
            for i in range(len(test_list) - 1)]

    #concat and make a single list
    lists_of_lists = res

    def concat_inner(arr):
        return arr[0]+arr[1]

    final_list = list(map(concat_inner, lists_of_lists))

    # print(final_list)

    listA =  final_list
    listB = res_list
    listC = []

    for b in listB:
        if any(a in b for a in listA):
            listC.append(b)

    item = listC[0]

    my_list = final_list
    matching_word = item

    # search for the item
    index = my_list.index(item)

    # print('The index of', matching_word, 'in the list is:', index)

    sound1 = AudioSegment.from_file(test_result_spaces_removed[index]+".wav", format="wav")
    sound2 = AudioSegment.from_file(test_result_spaces_removed[index+1]+".wav", format="wav")

    # sound1 6 dB louder
    louder = sound1 + 6

    combined = sound1 + sound2

    # simple export
    # file_handle = combined.export("AudioChunks/block_merge.wav", format="wav")
    file_handle = combined.export(test_result_spaces_removed[index]+test_result_spaces_removed[index+1]+".wav", format="wav")

    os.remove(test_result_spaces_removed[index]+".wav")
    os.remove(test_result_spaces_removed[index+1]+".wav")

    new_list = test_list
    removed_list = new_list.pop(index)
    removed_list = new_list.pop(index)

    new_list.insert(index, matching_word)
    
    sentence = " ".join(new_list)
    
    words = res_list

    for i in new_list:
        url_string = i
        res = [ele for ele in words if(ele in url_string)]
        words_list.append(res)

    print(words_list)

    words = res_list
    # new_list = ['අඅඅම්මා', 'සමසමසමනලයා', 'සමනලයා', 'බෝතලය']
    results = 0

    for w in words:
        results += new_list.count(w)
    
    
    




features_heading = {'chroma_stft':0,'rmse':0 ,'spectral_centroid':0	,'spectral_bandwidth':0,	'rolloff':0,	'zero_crossing_rate':0,	'mfcc1':0	,'mfcc2':0	,'mfcc3':0,	'mfcc4':0, 'mfcc5':0,'mfcc6':0,'mfcc7':0,'mfcc8':0,'mfcc9':0,'mfcc10':0,'mfcc11':0,'mfcc12':0	,'mfcc13':0	,'mfcc14':0	,'mfcc15':0	,'mfcc16':0	,'mfcc17':0,	'mfcc18':0,	'mfcc19':0,	'mfcc20':0}
#Feature_extract function 
def feature_extraction(file_name_path):
    word = f'{file_name_path}'
    y, sr = librosa.load(word, mono=True, duration=30)
    chroma_stft = librosa.feature.chroma_stft(y=y, sr=sr)
    rmse = librosa.feature.rms(y=y)
    spec_cent = librosa.feature.spectral_centroid(y=y, sr=sr)
    spec_bw = librosa.feature.spectral_bandwidth(y=y, sr=sr)
    rolloff = librosa.feature.spectral_rolloff(y=y, sr=sr)
    zcr = librosa.feature.zero_crossing_rate(y)
    mfcc = librosa.feature.mfcc(y=y, sr=sr)
    to_append = f'{np.mean(chroma_stft)} {np.mean(rmse)} {np.mean(spec_cent)} {np.mean(spec_bw)} {np.mean(rolloff)} {np.mean(zcr)}'    
    for e in mfcc:
        to_append += f' {np.mean(e)}'
    data_val=to_append.split()
    feature_key = 0
    for x in features_heading.keys():
        features_heading[x] = float(data_val[feature_key])
        feature_key=feature_key+1
    data = pd.DataFrame(features_heading,index=[0])
    features = data[0:1].values.reshape(len(data[0:1]),-1,1)
    return features

p_b = load_model('P_B_model_cnn.hdf5') # Prolonged vs Block 
p_s = load_model('P_S_model_cnn.hdf5') # Prolonged vs Singel
p_m = load_model('M_P_model_cnn.hdf5') # Prolonged vs Multi
s_b = load_model('B_M_model_cnn.hdf5') # Multi vs Block
s_m = load_model('M_S_model_cnn.hdf5') # Singel vs Multi
s_ns = load_model('F_S_model_cnn.hdf5')
m_b = load_model('B_M_model_cnn.hdf5')

def predict_type_phase1(word):
    feature = word[0]
    
    p=0 # Prolonged count   1 1 0 0 0 0
    b=0 # Block count       0 0 0 1 1 0
    m=0 # Multi count       0 0 1 0 0 0
    s=0 # Singel count      0 0 0 0 0 1
    ns=0

    prob = s_ns.predict(feature.reshape(1,-1,1))#model name
    if (prob[0][0] < 0.5):
        # pred='Not_sts'
        ns=ns+1
    else:
        # pred='sts'
        prob = p_b.predict(feature.reshape(1,-1,1))
        if (prob[0][0] < 0.5):
        # pred='block'
            b=b+1 
        else:
        # pred='prolonged'
            p=p+1 
    
        prob = p_s.predict(feature.reshape(1,-1,1))
        if (prob[0][0] < 0.5):
            # pred='single'
            s=s+1
        else:
            # pred='prolonged'
            p=p+1  
        
        prob = p_m.predict(feature.reshape(1,-1,1))
        if (prob[0][0] < 0.5):
            # pred='multi'
            m=m+1
        else:
            # pred='prolonged'
            p=p+1  
        
        prob = s_b.predict(feature.reshape(1,-1,1))
        if (prob[0][0] < 0.5):
            # pred='block'
            b=b+1
        else:
            # pred='single'
            s=s+1 
        
        prob = m_b.predict(feature.reshape(1,-1,1))
        if (prob[0][0] < 0.5):
            # pred='block'
            b=b+1
        else:
            # pred='multi'
            m=m+1 
        
        prob = s_m.predict(feature.reshape(1,-1,1))
        if (prob[0][0] < 0.5):
            # pred='multi'
            m=m+1 
        else:
            # pred='single'
            s=s+1 
        
    return p,b,m,s,ns 

def predict_type(p,b,m,s,ns,word):
    feature = word[0]
    if(ns > 0):
        print("Prediction: Non S")
        return('non_stuttering')
    elif(p == 3):
        print("Prediction: Prolonged")
        return('prolonged')
    elif(b == 3):
        print("Prediction: Block")
        return('block')
    elif(s == 3):
        print("Prediction: Single")
        return('single')
    elif(m == 3):
        print("Prediction: Multi")
        return('multi')        
    
    else:

        if(p == b & p == 2):
            prob = p_b.predict(feature.reshape(1,-1,1))
            if (prob[0][0] < 0.5):
                pred='block'
            else:
                pred='prolonged'
            print("Prediction pb:",pred)
            return(pred)

        if(p == s & p == 2):
            prob = p_s.predict(feature.reshape(1,-1,1))
            if (prob[0][0] < 0.5):
                pred='single'
            else:
                pred='prolonged'
            print("Prediction ps:",pred)
            return(pred)

        if(p == m & p == 2):
            prob = p_m.predict(feature.reshape(1,-1,1))
            if (prob[0][0] < 0.5):
                pred='multi'
            else:
                pred='prolonged'
            print("Prediction pm:",pred)
            return(pred)

        if(b == s & b == 2):
            prob = s_b.predict(feature.reshape(1,-1,1))
            if (prob[0][0] < 0.5):
                pred='block'
            else:
                pred='single'
            print("Prediction bs:",pred)
            return(pred)

        if(b == m & b == 2):
            prob = m_b.predict(feature.reshape(1,-1,1))
            if (prob[0][0] < 0.5):
                pred='block'
            else:
                pred='multi'
            print("Prediction bm:",pred)
            return(pred)

        if(s == m & s == 2):
            prob = s_m.predict(feature.reshape(1,-1,1))
            if (prob[0][0] < 0.5):
                pred='multi'
            else:
                pred='single'
            print("Prediction sm:",pred)
            return(pred)


def stutter_severity(type_list):
    severity_list = []   
    count = 0
    

    for i in range(len(type_list)):
        if type_list[i] != 'non_stuttering':
            count += 1

    print("Total word count: ", len(type_list))
    print("Stuttered word count: ", count)

    non_stuttering = 0
    single = 0
    multi = 0
    block = 0
    prolonged = 0

    for i in range(len(type_list)):
        if type_list[i] == 'non_stuttering':
            non_stuttering += 1
        elif  type_list[i] == 'single':
            single += 1
        elif  type_list[i] == 'multi':
            multi += 1
        elif  type_list[i] == 'block':
            block += 1
        elif  type_list[i] == 'prolonged':
            prolonged += 1   

    # print(non_stuttering, single, multi, block, prolonged)

    overall_severity = (count/ len(type_list)) * 100
    Single_severity = (single/ len(type_list)) * 100
    Multi_severity = (multi/ len(type_list)) * 100
    block_severity = (block/ len(type_list)) * 100
    prolonged_severity = (prolonged/ len(type_list)) * 100


    stages = ["Beginner Level Stuttering", "Intermediate Level Stuttering", "Advanced Level Stuttering", "None"]
    

    if overall_severity == 0.0:

        overall_severity_desc = stages[3]

    elif overall_severity >= 75.0:

        overall_severity_desc = stages[2]
        
    elif overall_severity >= 40.0:

        overall_severity_desc = stages[1]
          
    else:

        overall_severity_desc = stages[0]


    
    if Single_severity == 0.0:

        Single_severity_desc = stages[3]

    elif Single_severity >= 75.0:

        Single_severity_desc = stages[2]
        
    elif Single_severity >= 40.0:

        Single_severity_desc = stages[1]
          
    else:

        Single_severity_desc = stages[0]



    if Multi_severity == 0.0:

        Multi_severity_desc = stages[3]

    elif Multi_severity >= 75.0:

        Multi_severity_desc = stages[2]

    elif Multi_severity >= 40.0:

        Multi_severity_desc = stages[1]
   

    else:

        Multi_severity_desc = stages[0]


    if block_severity == 0.0:

        block_severity_desc = stages[3]

    elif block_severity >= 75.0:

        block_severity_desc = stages[2]

    
    elif block_severity >= 40.0:

        block_severity_desc = stages[1]
   
    else:

        block_severity_desc = stages[0]


    if prolonged_severity == 0.0:

        prolonged_severity_desc = stages[3]

    elif prolonged_severity >= 75.0:

        prolonged_severity_desc = stages[2]

    
    elif prolonged_severity >= 40.0:

        prolonged_severity_desc = stages[1]
   

    else:

        prolonged_severity_desc = stages[0]


    print("Overall_severity : ", overall_severity,"     Description : ",overall_severity_desc)
    print("Single_severity : ", Single_severity,"     Description : ", Single_severity_desc)
    print("Multi_severity : ", Multi_severity,"     Description : ", Multi_severity_desc)
    print("block_severity : ", block_severity,"     Description : ", block_severity_desc)
    print("prolonged_severity : ", prolonged_severity,"     Description : ", prolonged_severity_desc)

    severity_newlist = [["overall_severity",overall_severity],["prolonged_severity",prolonged_severity],["block_severity",block_severity],["Multi_severity",Multi_severity],["Single_severity",Single_severity]]
    severity_list.extend((overall_severity_desc, Single_severity_desc, Multi_severity_desc, block_severity_desc, prolonged_severity_desc))
    print(severity_newlist)
    return severity_newlist

@app.route("/predict", methods=["POST"])
def predict():
    if request.method == "POST":
        audio_file = request.files["file"]
        file_name = "Test2.wav" 
        audio_file.save(file_name)
        return jsonify(["success","gg"])


@app.route("/register", methods=["GET", "POST"])
def register():
    d = {}
    if request.method == "POST":
        request_data = request.form

        uname = request.form["uname"]
        mail = request.form["mail"]
        passw = request.form["passw"]

        print (uname)
        print (mail)
        print (passw)
        with app.app_context():
            db.session.add(Users(username=uname,email=mail,password=passw))
            db.session.commit()
            print("Enterd")   

        d["status"] = 11
        return jsonify(["Register success"])
        # return jsonify(d)

@app.route("/test")
def test():
     return jsonify(["Login"])

@app.route("/login",methods=["GET", "POST"])
def login():
    d = {}
    if request.method == "POST":
        uname = request.form["uname"]
        passw = request.form["passw"]
        
        print(uname)
        print(passw)
        login = Users.query.filter_by(username=uname, password=passw).first()

        if login is not None:
            # account found
            d["status"] = 11
            return jsonify(["Login Sucessfully",uname])
        else:
            # account not exist
            d["status"] = 22
            return jsonify(["Erorr"])


if __name__ == "__main__":
    # db.create_all()
    app.run(debug=True)












# from flask import Flask,request,jsonify
# from flask_sqlalchemy import SQLAlchemy

# app = Flask(__name__)
# app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:////Users/Krishan/Desktop/Database.db'
# db = SQLAlchemy(app)

# # this class is for creating tables in db
# class User(db.Model):
#     id = db.Column(db.Integer, primary_key=True)
#     username = db.Column(db.String(80))
#     email = db.Column(db.String(120))
#     password = db.Column(db.String(80))

# # with app.app_context():
# #     db.create_all()

# @app.route("/login",methods=["GET", "POST"])
# def login():
#     d = {}
#     if request.method == "POST":
#         uname = request.form["uname"]
#         passw = request.form["passw"]
        
#         login = User.query.filter_by(username=uname, password=passw).first()

#         if login is not None:
#             # account found
#             d["status"] = 11
#             return jsonify(d)
#         else:
#             # account not exist
#             d["status"] = 22
#             return jsonify(d)
            


# @app.route("/register", methods=["GET", "POST"])
# def register():
#     d = {}
#     if request.method == "POST":
#         request_data = request.data #getting the response data
#         # request_data = json.loads(request_data.decode('utf-8')) #converting it from json to key value pair
#         # name = request_data['name'] 
#         # users = user(
#         #         uname = request.form['uname'],
#         #         mail = request.form['mail'],
#         #         passw = request.form['passw'],
#         #     )
#         uname = request.form['uname'],
#         mail = request.form['mail'],
#         passw = request.form['passw'],

#         register = User(username = uname, email = mail, password = passw)
#         db.session.add(register)
#         db.session.commit()
#         print("Enterd")

#         # db.session.add(users)
#         # db.session.commit()

#         # return " "
#         # username = db.get_or_404(user, users.uname)
#         # username = user.query.filter_by(username=uname).first()
#         # print("suer is ", username)

            
            
#         return " "
#         # if username is None:
#         #     register = user(username = uname, email = mail, password = passw)
#         #     db.session.add(register)
#         #     db.session.commit()
#         #     print("Enterd")
#         #     d["status"] = 11
#         #     return jsonify(d)
#         # else:
#         #     print("GG")
#         #     # already exist
#         #     d["status"] = 22
#         #     return jsonify(d)

# if __name__ == "__main__":
#     db.create_all()
#     app.run(debug=True)