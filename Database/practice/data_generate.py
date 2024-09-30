import mysql.connector
from faker import Faker
import random # 파이선 기본 모듈

# 1) mysql 연결 설정
db_connection = mysql.connector.connect(
    host='localhost',
    user='root',
    password='dudgus724',
    database='testdatabase'
)

# 2) mysql 연결
cursor = db_connection.cursor()
faker = Faker()
print(db_connection)

# users 데이터 생성
for _ in range(100): # _ 는 굳이 사용하진 않고 100번 반복할거다.
    username = faker.user_name()
    email = faker.email()

    sql = "INSERT INTO users(username, email) VALUES(%s, %s)"
    param = (username, email)
    cursor.execute(sql, param)

# user_id  불러오기
sql2 = 'SELECT user_id FROM users'
cursor.execute(sql2)
valid_user_id = [row[0] for row in cursor.fetchall()]

# 100개의 주문 더미 데이터 생성
for _ in range(101) :
    user_id = random.choice(valid_user_id)
    product_name = faker.word()
    quantity = random.randint(1, 10)

    try :

        sql3 = "INSERT INTO orders(user_id, product_name, quantity) VALUES(%s, %s, %s)"
        param = (user_id, product_name, quantity)
        cursor.execute(sql3, param)

    except :
        pass


db_connection.commit()
cursor.close()