CREATE TABLE posts (
  id SERIAL NOT NULL PRIMARY KEY,
  title VARCHAR(255),
  content TEXT
);

INSERT INTO posts(title,content)
  VALUES
  ('hello world',E'#hello world\naaa bbb ccc ddd\naaa bbb ccc ddd\naaa bbb ccc ddd'),
  ('hello sinatra',E'#hello sinatra\n-aaa bbb ccc ddd\n-aaa bbb ccc ddd\n-aaa bbb ccc ddd'),
  ('hello ActiveRecord',E'#hello ActiveRecord\naaa bbb ccc ddd\naaa bbb ccc ddd\naaa bbb ccc'),
  ('hello paiza',E'#hello sinatra\naaa bbb ccc ddd\naaa bbb ccc ddd\naaa bbb ccc ddd'),
  ('こんにちは',E'#hello ActiveRecord\naaa bbb ccc ddd\naaa bbb ccc ddd\naaa bbb ccc');