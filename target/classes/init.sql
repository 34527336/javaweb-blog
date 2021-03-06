Drop Table If Exists `Article`;
Create Table `Article`(
	`Id` Int Unsigned Not Null Auto_Increment Comment '主键',
	`Title` Varchar(50) Not Null Comment '文章名称',
	`Image` Varchar(50) Null Comment '文章封面图片',
	`Content` MediumText Not Null Comment '文章内容',
	`CreateId` Int Not Null Comment '创建者id',
	`CreateTime` DateTime Null Comment '文章发布时间',
	Primary Key(`Id`)
)Comment = '文章';

Drop Table If Exists `Tag`;
Create Table `Tag`(
	`Id` Int Unsigned Not Null Auto_Increment Comment '主键',
	`Name` Varchar(50) Not Null Comment '名称',
	`Discription` Varchar(50) Null Comment '描述',
	`CreateTime` DateTime Null Comment '创建时间',
	Primary Key(`Id`)
)Comment = '标签';

Drop Table If Exists `ArticleTag`;
Create Table `ArticleTag`(
	`Id` Int Unsigned Not Null Auto_Increment Comment '主键',
	`ArticleId` Int Not Null Comment '文章id',
	`TagId` Int Not Null Comment '标签id',
	Primary Key(`Id`)
)Comment = '文章标签表';

Drop Table If Exists `Model`;
Create Table `Model`(
	`Id` Int Unsigned Not Null Auto_Increment Comment '主键',
	`Name` Varchar(50) Not Null Comment '名称',
	`Discription` Varchar(50) Null Comment '描述',
	`CreateTime` DateTime Null Comment '创建时间',
	Primary Key(`Id`)
)Comment = '类型';

Drop Table If Exists `ArticleModel`;
Create Table `ArticleModel`(
	`Id` Int Unsigned Not Null Auto_Increment Comment '主键',
	`ArticleId` Int Not Null Comment '文章id',
	`ModelId` Int Not Null Comment '类型id',
	Primary Key(`Id`)
)Comment = '文章类型表';

Drop Table If Exists `Admin`;
Create Table `Admin`(
	`Id` Int(10) Unsigned Not Null Auto_Increment Comment '主键',
	`UserName` Varchar(20) Not NUll Comment '用户名',
	`Password` Varchar(20) Not Null Comment '密码',
	`Icon` Varchar(20) Null Comment '图标',
	`Email` Varchar(50) Null Comment '邮箱',
	`CreateTime` DateTime Not Null Comment '创建时间',
	Primary Key(`Id`)
)Comment = '后台用户表';

Drop Table If Exists `OperationLog`;
Create Table `OperationLog`(
	`Id` Int Unsigned Not Null Auto_Increment Comment '主键',
	`ModuleName` Varchar(20) Not Null Comment '模块名称',
	`ActionName` Varchar(20) Not Null Comment '执行的动作',
	`MethodName` Varchar(20) Not Null Comment '方法名称',
	`Params` Varchar(200) Not Null Comment '参数',
	`OperUserId` Int(10) Unsigned Not Null Comment '操作者id',
	`OperUrl` Varchar(200) Not Null Comment '请求url',
	`OperIp` Varchar(200) Not Null Comment '请求ip',
	`OperLocation` Varchar(200) Null Comment '请求所在地',
	`Success` Bit Default 1 Comment '是否成功',
	`ErrorMsg` Varchar(200) Null Comment '失败日志',
	Primary Key(`Id`),  
	Constraint `fk_OperationLog_OUId` Foreign Key(`OperUserId`) References `Admin`(`Id`)
)Comment = '日志记录表';

