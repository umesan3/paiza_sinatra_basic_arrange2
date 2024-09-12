# メモ帳アプリ：メモ一覧を表示する
require 'pg'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'
require 'erb'
require 'redcarpet'

ActiveRecord::Base.configurations = YAML.load_file('database.yml')
ActiveRecord::Base.establish_connection(:development)

class Post < ActiveRecord::Base
    belongs_to :user
end

class User < ActiveRecord::Base
    has_many :posts
  end

#メモ一覧画面
get '/' do
    @posts = Post.all
    erb :posts_index
end

#メモ一覧画面
#get '/posts' do
#    @posts = Post.all
#    @users = User.all
#   erb :posts_index  
#end

#メモ詳細画面
get '/posts/get/:id' do
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    @post = Post.find(params['id'])
    erb :posts_show
end

#メモ編集画面
get '/posts/edit/:id' do
    @post = Post.find(params['id'])
    erb :posts_edit
end

#メモ編集画面で「更新する」ボタンを押下したときの挙動
post '/posts/patch/:id' do
    post = Post.find(params['id'])

    post.title = params['title']
    post.content = params['content']
    post.save

    redirect "/posts/get/#{params['id']}"
end

#メモ編集画面で「削除する」ボタンを押下したときの挙動
get '/posts/delete/:id' do
    Post.find(params['id']).destroy
    redirect '/'
end

#メモ登録画面
get '/posts/new' do
    @users = User.all
    erb :posts_new
end

#メモ登録画面で「保存する」ボタンを押下したときの挙動★★
post '/posts/post' do
    post = Post.create({
            title: params['title'],
            content: params['content'],
            user_id: params['user_id'] })
    redirect "/posts/get/#{post.id}"
end

#ユーザー登録画面
get '/users/new' do
    erb :users_new
end

#ユーザー登録画面で「保存する」ボタンを押下したときの挙動
post '/users/register' do
    post = User.create({name: params['name']})
    redirect "/"
end