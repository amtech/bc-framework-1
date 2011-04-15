-- ϵͳ��ʶ���ģ��
-- ������
create table BC_IDENTITY_ACTOR (
    ID integer NOT NULL auto_increment,
    UID varchar(20) NOT NULL COMMENT 'ȫ�ֱ�ʶ',
    TYPE_ integer(1) NOT NULL COMMENT '���ͣ�1-�û�,2-��λ,3-����,4-��λ',
    STATUS integer(1) NOT NULL COMMENT '״̬��0-�ѽ���,1-������,2-��ɾ��',
    CODE varchar(255) COMMENT '����',
    NAME varchar(255) COMMENT '����',
    ORDERNO varchar(100) COMMENT 'ͬ�������֮��������',
    EMAIL varchar(255) NOT NULL COMMENT '����',
    PHONE varchar(255) NOT NULL COMMENT '��ϵ�绰',
    primary key (ID)
) COMMENT='������(����һ���˻���֯����֯Ҳ�����ǵ�λ�����š���λ���Ŷӵ�';

-- ������֮��Ĺ�����ϵ
create table BC_IDENTITY_ACTOR_RELATION (
    TYPE_ integer(2) NOT NULL COMMENT '��������',
    MASTER_ID integer NOT NULL COMMENT '���ط�ID',
   	FOLLOWER_ID integer NOT NULL COMMENT '������ID',
    ORDERNO varchar(100) COMMENT '������֮��������',
    primary key (MASTER_ID,FOLLOWER_ID,TYPE_)
) COMMENT='������֮��Ĺ�����ϵ';
ALTER TABLE BC_IDENTITY_ACTOR_RELATION ADD CONSTRAINT FK_ARM_ACTOR FOREIGN KEY (MASTER_ID) 
	REFERENCES BC_IDENTITY_ACTOR (ID);
ALTER TABLE BC_IDENTITY_ACTOR_RELATION ADD CONSTRAINT FK_ARF_ACTOR FOREIGN KEY (FOLLOWER_ID) 
	REFERENCES BC_IDENTITY_ACTOR (ID);

-- �����ߵ���չ����
create table BC_IDENTITY_ACTOR_DETAIL (
    ID integer NOT NULL,
    USER_FIRST_NAME varchar(255) NOT NULL COMMENT 'user-����',
    USER_LAST_NAME varchar(255) NOT NULL COMMENT 'user-����',
    USER_SEX integer(1) NOT NULL COMMENT 'user-�Ա�1-��,2-Ů',
    primary key (ID)
) COMMENT='�����ߵ���չ����';
ALTER TABLE BC_IDENTITY_ACTOR_DETAIL ADD CONSTRAINT FK_ACTORDETAIL_ACTOR FOREIGN KEY (ID) 
	REFERENCES BC_IDENTITY_ACTOR (ID) ON DELETE CASCADE ON UPDATE RESTRICT;
