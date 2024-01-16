# web_server.py
# /home/bello/project_env/bin/python /home/bello/project_test/web_server.py

from flask import Flask, render_template, request, redirect, url_for, flash, session
from flask_mysqldb import MySQL
from flask_cors import CORS
import secrets
import alsaaudio
import os
from flask_socketio import SocketIO


app = Flask(__name__)
CORS(app)
socketio = SocketIO(app, cors_allowed_origins="*")

app.secret_key = 'bello'
app.config['MYSQL_HOST'] = 'project-db-campus.smhrd.com'
app.config['MYSQL_PORT'] = 3307
app.config['MYSQL_USER'] = 'campus_23K_SG4_hack_3'
app.config['MYSQL_PASSWORD'] = 'smhrd3'
app.config['MYSQL_DB'] = 'campus_23K_SG4_hack_3'

mysql = MySQL(app)
audio = alsaaudio.Mixer()

#LCDpage 웹소켓으로 이전
@app.route('/')
def LCDpage():
    #session['user_id'] = 'test0110' #test용 세션
    return render_template('LCDpage.html')

#setting
@app.route('/setting')
def setting_page():
    # doorbell_info 값을 쿼리스트링에서 받아오기
    user_id = request.args.get('user_id')

    # doorbell_info 값을 세션에 저장
    session['user_id'] = user_id
    return render_template('setting.html')
    
@app.route('/update_volume', methods=['POST'])
def update_volume():
    if 'user_id' in session:
        user_id = session.get('user_id')
        sound_level = request.form.get('sound_level')
        sound_path = request.form.get('sound_path')
        
        # MySQL 업데이트
        cur = mysql.connection.cursor()
        cur.execute("UPDATE campus_23K_SG4_hack_3.doorbell_info SET sound_level = %s, sound_path = %s WHERE user_id = %s", (sound_level, sound_path, user_id))
        mysql.connection.commit()
        cur.close()
        

        flash('볼륨이 성공적으로 변경되었습니다.', 'success')
        return redirect(url_for('setting_page'))
    else:
        flash('볼륨 변경이 실패했습니다.', 'error')
        return redirect(url_for('setting_page'))

@app.route('/get_sound_path', methods=['GET'])
def get_sound_path():
    user_id = session.get('user_id')

    # 사용자가 로그인한 경우와 로그인하지 않은 경우를 구분하여 처리
    if 'user_id' in session:
        # MySQL에서 sound_path 가져오기
        cur = mysql.connection.cursor()
        cur.execute("SELECT sound_path FROM campus_23K_SG4_hack_3.doorbell_info WHERE user_id = %s", (user_id,))
        result = cur.fetchone()
        cur.close()

        if result:
            sound_path = result[0]
            return {'sound_path': sound_path}
        else:
            return {'sound_path': '/static/bgm/berdi.mp3'}
    else:
        # 세션에 user_id가 없는 경우 기본 음악 파일 경로 반환
        default_sound_path = '/static/bgm/berdi.mp3'
        return {'sound_path': default_sound_path}
    
#video
@app.route('/setting/video')
def video_page():
    return render_template('video.html')#/home/bello/video.html  video.html

if __name__ == '__main__':

    # Start Flask with SocketIO
    app.run(host='172.30.1.6', port=8002, use_reloader=False, debug=True)
