/**
 * 
 */
package cn.bc.desktop.domain;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import cn.bc.core.DefaultEntity;
import cn.bc.identity.domain.ActorImpl;

/**
 * ��������
 * 
 * @author dragon
 */
@Entity
@Table(name = "BC_DESKTOP_PERSONAL")
public class Personal extends DefaultEntity {
	private static final long serialVersionUID = 1L;

	private String font;// �����С
	private String theme;// ��������
	private ActorImpl actor;// �����Ĳ�����

	public String getFont() {
		return font;
	}

	public void setFont(String font) {
		this.font = font;
	}

	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

	//TODO struts2����Ϊ�ӿ�ʱ��������޷�ʵ����
	@ManyToOne(targetEntity = ActorImpl.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "AID", nullable = true, updatable = false)
	public ActorImpl getActor() {
		return actor;
	}

	public void setActor(ActorImpl actor) {
		this.actor = actor;
	}
}
