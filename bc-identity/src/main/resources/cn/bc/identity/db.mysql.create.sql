-- ģ��
create table BC_SECURITY_MODULE (
    ID integer NOT NULL auto_increment,
    BELONG integer COMMENT '��������ģ��',
    TYPE_ integer(1) NOT NULL COMMENT '���ͣ�1-�ļ���,2-�ڲ�����,3-�ⲿ����',
    CODE varchar(255) NOT NULL COMMENT '����',
    LABEL varchar(255) NOT NULL COMMENT '����',
    URL varchar(255) COMMENT '��ַ',
    primary key (ID)
) COMMENT='ϵͳģ��';

-- ������
create table BC_IDENTITY_ACTOR (
    ID integer NOT NULL auto_increment,
    UID varchar(20) NOT NULL COMMENT 'ȫ�ֱ�ʶ',
    NAME varchar(255) COMMENT '����',
    TYPE_ integer(1) NOT NULL COMMENT '���ͣ�1-�û�,2-��λ,3-����,4-��λ',
    EMAIL varchar(255) NOT NULL COMMENT '��ϵ����',
    PHONE varchar(255) NOT NULL COMMENT '��ϵ�绰',
    primary key (ID)
) COMMENT='������';

-- �û�
create table BC_IDENTITY_USER (
    ID integer NOT NULL,
    FIRST_NAME varchar(255) NOT NULL COMMENT '����',
    LAST_NAME varchar(255) NOT NULL COMMENT '����',
    SEX integer(1) NOT NULL COMMENT '�Ա�1-��,2-Ů',
    primary key (ID)
) COMMENT='�û�';
ALTER TABLE BC_IDENTITY_USER ADD CONSTRAINT UserRFActor FOREIGN KEY (ID) 
	REFERENCES BC_IDENTITY_ACTOR (ID) ON DELETE CASCADE ON UPDATE RESTRICT;

-- ��֯����λ�����š���λ
create table BC_IDENTITY_ORGANIZER (
    ID integer NOT NULL,
    BELONG integer COMMENT '����������֯',
    primary key (ID)
) COMMENT='��֯����λ�����š���λ';
ALTER TABLE BC_IDENTITY_ORGANIZER ADD CONSTRAINT OrganizerRFActor FOREIGN KEY (ID) 
	REFERENCES BC_IDENTITY_ACTOR (ID) ON DELETE CASCADE ON UPDATE RESTRICT;
