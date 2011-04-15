-- ϵͳ��ȫ���ģ��
-- ģ��
create table BC_SECURITY_MODULE (
    ID integer NOT NULL auto_increment,
    BELONG integer COMMENT '��������ģ��',
    TYPE_ integer(1) NOT NULL COMMENT '���ͣ�1-�ļ���,2-�ڲ�����,3-�ⲿ����,4-html',
    CODE varchar(255) NOT NULL COMMENT '����',
    LABEL varchar(255) NOT NULL COMMENT '����',
    URL varchar(255) COMMENT '��ַ',
    OPTIONS text COMMENT '��չ����',
    primary key (ID)
) COMMENT='ϵͳģ��';

-- ��ɫ
create table BC_SECURITY_ROLE (
    ID integer NOT NULL auto_increment,
    ORG_ID integer COMMENT '����������֯',
   	TYPE_ integer(1) NOT NULL COMMENT '����',
    CODE varchar(255) NOT NULL COMMENT '����',
    LABEL varchar(255) NOT NULL COMMENT '����',
    primary key (ID)
) COMMENT='ϵͳ��ɫ';
ALTER TABLE BC_SECURITY_ROLE ADD CONSTRAINT FK_ROLE_ORGANIZER FOREIGN KEY (ORG_ID) 
	REFERENCES BC_IDENTITY_ORGANIZER (ID);

-- ��ɫ��Ȩ�޵Ĺ���
create table BC_SECURITY_ROLE_MODULE (
    RID integer NOT NULL COMMENT '��ɫID',
    MID integer NOT NULL COMMENT 'ģ��ID',
    primary key (RID,MID)
) COMMENT='��ɫ��Ȩ�޵Ĺ���';
ALTER TABLE BC_SECURITY_ROLE_MODULE ADD CONSTRAINT FK_RM_ROLE FOREIGN KEY (RID) 
	REFERENCES BC_SECURITY_ROLE (ID);
ALTER TABLE BC_SECURITY_ROLE_MODULE ADD CONSTRAINT FK_RM_MODULE FOREIGN KEY (MID) 
	REFERENCES BC_SECURITY_MODULE (ID);
