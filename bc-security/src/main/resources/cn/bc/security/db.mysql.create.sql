-- ϵͳ��ȫ���ģ��
-- ģ��
create table BC_SECURITY_MODULE (
    ID int NOT NULL auto_increment,
    STATUS int(1) NOT NULL COMMENT '״̬��0-�ѽ���,1-������,2-��ɾ��',
    INNER_ int(1) COMMENT '�Ƿ�Ϊ���ö���:0-��,1-��',
    BELONG int COMMENT '��������ģ��',
    TYPE_ int(1) NOT NULL COMMENT '���ͣ�1-�ļ���,2-�ڲ�����,3-�ⲿ����,4-html',
    CODE varchar(100) NOT NULL COMMENT '���룬����������',
    NAME varchar(255) NOT NULL COMMENT '����',
    URL varchar(255) COMMENT '��ַ',
    OPTIONS text COMMENT '��չ����',
    primary key (ID)
) COMMENT='ģ��';

-- ��ɫ
create table BC_SECURITY_ROLE (
    ID int NOT NULL auto_increment,
    STATUS int(1) NOT NULL COMMENT '״̬��0-�ѽ���,1-������,2-��ɾ��',
    INNER_ int(1) COMMENT '�Ƿ�Ϊ���ö���:0-��,1-��',
   	TYPE_ int(1) NOT NULL COMMENT '����',
    CODE varchar(100) NOT NULL COMMENT '���룬����������',
    NAME varchar(255) NOT NULL COMMENT '����',
    primary key (ID)
) COMMENT='��ɫ';

-- ��ɫ��ģ��Ĺ���
create table BC_SECURITY_ROLE_MODULE (
    RID int NOT NULL COMMENT '��ɫID',
    MID int NOT NULL COMMENT 'ģ��ID',
    primary key (RID,MID)
) COMMENT='��ɫ��ģ��Ĺ�������ɫ����ʹ����Щģ����Դ';
ALTER TABLE BC_SECURITY_ROLE_MODULE ADD CONSTRAINT FK_RM_ROLE FOREIGN KEY (RID) 
	REFERENCES BC_SECURITY_ROLE (ID);
ALTER TABLE BC_SECURITY_ROLE_MODULE ADD CONSTRAINT FK_RM_MODULE FOREIGN KEY (MID) 
	REFERENCES BC_SECURITY_MODULE (ID);
