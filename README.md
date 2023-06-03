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
- rails g scaffold LineItem product:references cart:belongs_to 生成LineItem模型，其中LineItem引用product，并且属于cart
- rails g migration add_quantity_to_line_items quantity:integer 生成迁移文件，添加XX属性到哪张表里，后面接字段与类比，会自动生成文件，但默认值需要自己写
  - rails g migration add_xxx_to_xxx
  - rails g migration remove_xxx_from_xxx
- rails g migration combine_items_in_cart 生成合并的迁移文件，但这里rails无法推断出要干嘛，所以需要自己写，这里需要写 up ， down方法，up表示你要干的事儿，down表示撤销你up 的操作
- rails g channel products 使用Action Cable,生成广播
## 验证与单元测试
验证：数据校验
model 中进行 validates 校验

## Bug修复
### 

单元测试：需要注意，单元测试使用的数据，默认为 /test/fixtures/your_models.yml 中配置的数据