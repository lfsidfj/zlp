package com.szjm.entity.zlp;

import java.io.Serializable;

public class GiftArea implements Serializable {
    private String GIFTAREA_ID;
    private String AREA_NAME;
    private int SEQENCE;
    private String CHECKIDS;

    public String getCHECKIDS() {
        return CHECKIDS;
    }

    public void setCHECKIDS(String CHECKIDS) {
        this.CHECKIDS = CHECKIDS;
    }

    public String getGIFTAREA_ID() {
        return GIFTAREA_ID;
    }

    public void setGIFTAREA_ID(String GIFTAREA_ID) {
        this.GIFTAREA_ID = GIFTAREA_ID;
    }

    public String getAREA_NAME() {
        return AREA_NAME;
    }

    public void setAREA_NAME(String AREA_NAME) {
        this.AREA_NAME = AREA_NAME;
    }

    public int getSEQENCE() {
        return SEQENCE;
    }

    public void setSEQENCE(int SEQENCE) {
        this.SEQENCE = SEQENCE;
    }

}
