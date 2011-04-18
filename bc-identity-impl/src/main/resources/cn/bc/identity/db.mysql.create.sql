-- ϵͳ��ʶ���ģ��
-- ������
create table BC_IDENTITY_ACTOR (
    ID int NOT NULL auto_increment,
    UID varchar(20) NOT NULL COMMENT 'ȫ�ֱ�ʶ',
    TYPE_ int(1) NOT NULL COMMENT '���ͣ�1-�û�,2-��λ,3-����,4-��λ',
    STATUS int(1) NOT NULL COMMENT '״̬��0-�ѽ���,1-������,2-��ɾ��',
    INNER_ int(1) NOT NULL COMMENT '�Ƿ�Ϊ���ö���:0-��,1-��',
    CODE varchar(100) NOT NULL COMMENT '����',
    NAME varchar(255) NOT NULL COMMENT '����',
    ORDER_ varchar(100) COMMENT 'ͬ�������֮��������',
    EMAIL varchar(255) COMMENT '����',
    PHONE varchar(255) COMMENT '��ϵ�绰',
    primary key (ID)
) COMMENT='������(����һ���˻���֯����֯Ҳ�����ǵ�λ�����š���λ���Ŷӵ�)';

-- ������֮��Ĺ�����ϵ
create table BC_IDENTITY_ACTOR_RELATION (
    TYPE_ int(2) NOT NULL COMMENT '��������',
    MASTER_ID int NOT NULL COMMENT '���ط�ID',
   	FOLLOWER_ID int NOT NULL COMMENT '������ID',
    ORDER_ varchar(100) COMMENT '������֮��������',
    primary key (MASTER_ID,FOLLOWER_ID,TYPE_)
) COMMENT='������֮��Ĺ�����ϵ';
ALTER TABLE BC_IDENTITY_ACTOR_RELATION ADD CONSTRAINT FK_ARMASTER_ACTOR FOREIGN KEY (MASTER_ID) 
	REFERENCES BC_IDENTITY_ACTOR (ID);
ALTER TABLE BC_IDENTITY_ACTOR_RELATION ADD CONSTRAINT FK_ARFOLLOWER_ACTOR FOREIGN KEY (FOLLOWER_ID) 
	REFERENCES BC_IDENTITY_ACTOR (ID);

-- �����ߵ���չ����
create table BC_IDENTITY_ACTOR_DETAIL (
    ID int NOT NULL,
    USER_FIRST_NAME varchar(10) COMMENT 'user-����',
    USER_LAST_NAME varchar(10) COMMENT 'user-����',
    USER_SEX int(1) COMMENT 'user-�Ա�1-��,2-Ů',
    primary key (ID)
) COMMENT='�����ߵ���չ����';
ALTER TABLE BC_IDENTITY_ACTOR_DETAIL ADD CONSTRAINT FK_ACTORDETAIL_ACTOR FOREIGN KEY (ID) 
	REFERENCES BC_IDENTITY_ACTOR (ID) ON DELETE CASCADE ON UPDATE RESTRICT;


-- ְ��
create table BC_IDENTITY_DUTY (
    ID int NOT NULL auto_increment,
    UID varchar(20) NOT NULL COMMENT 'ȫ�ֱ�ʶ',
    STATUS int(1) NOT NULL COMMENT '״̬��0-�ѽ���,1-������,2-��ɾ��',
    INNER_ int(1)) NOT NULL COMMENT '�Ƿ�Ϊ���ö���:0-��,1-��',
    CODE varchar(100) NOT NULL COMMENT '����',
    NAME varchar(255) NOT NULL COMMENT '����',
    primary key (ID)
) COMMENT='ְ��';

