class Users::ArticlesController < ApplicationController
  def new
    @article = current_user.articles.new
  end

  def create
    @article = current_user.articles.new(article_params)
    
    if @article.save
      flash[:success] = "新規作成に成功しました"
      redirect_to users_article_path(@article)
    else
      render :new
    end
  end

  def index
    @articles = current_user.articles.all
  end

  def show
    @article = Article.find(params[:id])
  end


private

  def article_params
    params.require(:article).permit(:title, :content, :image)
  end

end