-- ϵͳ��ʶ���ģ��
-- ������
create table BC_IDENTITY_ACTOR (
    ID integer NOT NULL auto_increment,
    UID varchar(20) NOT NULL COMMENT 'ȫ�ֱ�ʶ',
    NAME varchar(255) COMMENT '����',
    TYPE_ integer(1) NOT NULL COMMENT '���ͣ�1-�û�,2-��λ,3-����,4-��λ',
    EMAIL varchar(255) NOT NULL COMMENT '��ϵ����',
    PHONE varchar(255) NOT NULL COMMENT '��ϵ�绰',
    primary key (ID)
) COMMENT='�¼�������';

-- ������֮��Ĺ�����ϵ
create table BC_IDENTITY_ACTOR_RELATION (
    TYPE_ integer(2) NOT NULL COMMENT '��������',
    MASTER_ID integer NOT NULL COMMENT '���ط�ID',
   	FOLLOWER_ID integer NOT NULL COMMENT '������ID',
    ORDERNO varchar(5) COMMENT '������֮��������',
    primary key (MASTER_ID,FOLLOWER_ID,TYPE_)
) COMMENT='������֮��Ĺ�����ϵ';
ALTER TABLE BC_IDENTITY_ACTOR_RELATION ADD CONSTRAINT FK_ARM_ACTOR FOREIGN KEY (MASTER_ID) 
	REFERENCES BC_IDENTITY_ACTOR (ID);
ALTER TABLE BC_IDENTITY_ACTOR_RELATION ADD CONSTRAINT FK_ARF_ACTOR FOREIGN KEY (FOLLOWER_ID) 
	REFERENCES BC_IDENTITY_ACTOR (ID);

-- �û�
create table BC_IDENTITY_USER (
    ID integer NOT NULL,
    FIRST_NAME varchar(255) NOT NULL COMMENT '����',
    LAST_NAME varchar(255) NOT NULL COMMENT '����',
    SEX integer(1) NOT NULL COMMENT '�Ա�1-��,2-Ů',
    primary key (ID)
) COMMENT='ϵͳ�û�';
ALTER TABLE BC_IDENTITY_USER ADD CONSTRAINT FK_USER_ACTOR FOREIGN KEY (ID) 
	REFERENCES BC_IDENTITY_ACTOR (ID) ON DELETE CASCADE ON UPDATE RESTRICT;

-- ��֯����λ�����š���λ
create table BC_IDENTITY_ORGANIZER (
    ID integer NOT NULL,
    BELONG integer COMMENT '����������֯',
    primary key (ID)
) COMMENT='��֯����λ�����š���λ';
ALTER TABLE BC_IDENTITY_ORGANIZER ADD CONSTRAINT FK_ORGANIZER_ACTOR FOREIGN KEY (ID) 
	REFERENCES BC_IDENTITY_ACTOR (ID) ON DELETE CASCADE ON UPDATE RESTRICT;


-- ϵͳ��ȫ���ģ��
-- ģ��
create table BC_SECURITY_MODULE (
    ID integer NOT NULL auto_increment,
    BELONG integer COMMENT '��������ģ��',
    TYPE_ integer(1) NOT NULL COMMENT '���ͣ�1-�ļ���,2-�ڲ�����,3-�ⲿ����',
    CODE varchar(255) NOT NULL COMMENT '����',
    LABEL varchar(255) NOT NULL COMMENT '����',
    URL varchar(255) COMMENT '��ַ',
    OPTIONS varchar(255) COMMENT 'ģ��ĳ�ʼ������',
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
