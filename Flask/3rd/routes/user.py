from flask import request, jsonify
from flask_smorest import Blueprint
from flask.views import MethodView
from marshmallow import Schema, fields
from db import db
from models import User

#스키마 정의
class UserSchema(Schema):
    id = fields.Int(dump_only = True)
    name = fields.Str(required = True)
    email = fields.Str(required = True)

user_blp = Blueprint("Users", "users", description="Operations on users", url_prefix="/user")
# API List
# (1) 전체 유저 데이터 조회 (GET)
# (2) 유저 생성 (POST)
@user_blp.route('/')
class UserList(MethodView):
    @user_blp.response(200, UserSchema(mary=True)) #스키마를 통해 데이터를 한 번 더 검증해줄 수 있다. 클라이언트와 서버 간 데이터 포맷을 정의하고 관리한다.
    def get(self):
        users = User.query.all()
        user_data = [{
            'id' : user.id,
            'name' : user.name,
            'email' : user.email
        } for user in users]
        return jsonify(user_data)
    
    @user_blp.arguments(UserSchema)
    @user_blp.response(201, UserSchema)
    def post(self):
        data = request.json
        new_user = User(name=data['name'], email=data['email'])
        db.session.add(new_user)
        db.session.commit()

        return jsonify({"msg" : "successfully create new user!"}), 201

# (1) 특정 유저 조회 (GET)
# (2) 특정 유저 업데이트 (PUT)
# (3) 특정 유저 삭제 (DELETE)
@user_blp.route('/<int:user_id>')
class UserResouce(MethodView):
    def get(self, user_id):
        user = User.query.get_or_404(user_id)

        return jsonify({'name':user.name, 'email':user.email})
    
    def put(self, user_id):
        user = User.query.get_or_404(user_id)
        data = request.json
        user.name = data['name']
        user.email = data['email']
        db.session.commit()

        return jsonify({'msg' : 'User data updated!'})
    
    def delete(self, user_id):
        user = User.query.get_or_404(user_id)
        db.session.delete(user)
        db.session.commit()

        return jsonify({'msg' : 'User data deleted!'})