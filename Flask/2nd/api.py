from flask.views import MethodView
from flask_smorest import Blueprint, abort
from schemas import BookSchema

book_blp = Blueprint('books', 'books', url_prefix='/books', description='Operations on books')

books = []

#블루프린트 설정
@book_blp.route('/')
class BookList(MethodView):
    @book_blp.response(200, BookSchema(many=True))
    def get(self):
        return books

    @book_blp.arguments(BookSchema)
    @book_blp.response(201, BookSchema)
    def post(self, new_data):
        new_data['id'] = len(books) + 1
        books.append(new_data)
        return new_data

#int 형 카테고리 정보를 uri에 담아 여러가지 처리를 할 수 있도록 route 설정
@book_blp.route('/<int:book_id>')
class Book(MethodView):
    #해당 데이터가 있을시 응답코드 200, 해당 정보를 가져옴
    @book_blp.response(200, BookSchema) 
    def get(self, book_id):
        book = next((book for book in books if book['id'] == book_id), None) #book의 id 값이 요청한 것과 같은 것이 books 안에 있으면 그 정보를 book에 담고, 없으면 None.
        if book is None:
            abort(404, message="Book not found.")
        return book

    #put 메서드를 통해 카테고리 값으로 보낸 book_id 가 일치할 경우 해당 데이터를 new_data로 업데이트
    @book_blp.arguments(BookSchema)
    @book_blp.response(200, BookSchema)
    def put(self, new_data, book_id):
        book = next((book for book in books if book['id'] == book_id), None)
        if book is None:
            abort(404, message="Book not found.") #없으면 404 에러 응답 코드
        book.update(new_data)
        return book

    #delete 메서드를 통해 book_id 가 일치할 경우 해당 데이터를 삭제.
    @book_blp.response(204)
    def delete(self, book_id):
        global books
        book = next((book for book in books if book['id'] == book_id), None)
        if book is None:
            abort(404, message="Book not found.")
        books = [book for book in books if book['id'] != book_id]
        return ''