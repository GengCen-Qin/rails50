## Rails 命令行
- rails new project
- rails g scaffold Product title:string description:text image_url:string price:decimal 脚手架生成，并生成migrate迁移文件
- rails d scaffold Product 删除生成文件
- rails db:migrate 导入未使用的迁移文件到数据库中
- rails test 测试
- rails test:models 测试model层
- rails db:seed 把seed.rb 下的测试数据导入数据库，这是为了方便团队其他人员使用时，不需要自己再创建数据，直接导入
- rails db:rollback 回滚最近一次 rails db:migrate 的操作
- rails dev:cache 开发环境开启缓存

## 验证与单元测试
验证：数据校验
model 中进行 validates 校验

单元测试：需要注意，单元测试使用的数据，默认为 /test/fixtures/your_models.yml 中配置的数据