class BooksController < ApplicationController
    before_action :authenticate_user!, except: [:show] 

    def index
        @user = current_user
        @books = current_user.books #ログインユーザーの登録した本のみ表示
    end

    def new
        @book = current_user.books.build
    end

    def create
        @user = current_user
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
          flash[:notice] = "新しい本を本棚に追加しました"
          redirect_to @book
        else
          render :new
        end
    end

    def show
        @user = current_user
        @book = Book.find(params[:id])
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            flash[:notice] = '本棚を更新しました'
            redirect_to @book 
        else
            render :edit
        end
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_url , notice: '本を削除しました'
    end
end
