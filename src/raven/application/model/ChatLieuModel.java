/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package raven.application.model;

/**
 *
 * @author dungn
 */
public class ChatLieuModel {
    public String ID;
    public String TenCL;
    public String MoTa;
    public int stt;

    public ChatLieuModel() {
    }

    public ChatLieuModel(String ID, String TenCL, String MoTa) {
        this.ID = ID;
        this.TenCL = TenCL;
        this.MoTa = MoTa;
    }

    public ChatLieuModel(String chatlieu) {
        this.TenCL = chatlieu;
    }
    
    public String getID() {
        return ID;
    }

    public String getTenCL() {
        return TenCL;
    }

    public String getMoTa() {
        return MoTa;
    }

    public int getStt() {
        return stt;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public void setTenCL(String TenCL) {
        this.TenCL = TenCL;
    }

    public void setMoTa(String MoTa) {
        this.MoTa = MoTa;
    }

    public void setStt(int stt) {
        this.stt = stt;
    }
    
    public Object[] toData(){
        return new Object[]{
            this.stt,
            this.ID,
            this.TenCL,
            this.MoTa
        };
    }

    
}
