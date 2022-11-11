/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package business;

import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author Ashbb
 */
public class Appointments {
    private int apptID;
    private LocalDate apptDate;
    private LocalTime apptTime;
    private int userID;
    private String userFirstName;
    private String userLastName;
    private String doctorFirstName;
    private String doctorLastName;
    private int apptType;
    private String reasonForVisit;
    private String insuranceProvider;
    private String insurancePlanNum;
    private String notes;


    public Appointments(int apptID, LocalDate apptDate, LocalTime apptTime, int userID, String userFirstName, String userLastName, String doctorFirstName, String doctorLastName, int apptType, String reasonForVisit, String insuranceProvider, String insurancePlanNum, String notes) {
        this.apptID = apptID;
        this.apptDate = apptDate;
        this.apptTime = apptTime;
        this.userID = userID;
        this.userFirstName = userFirstName;
        this.userLastName = userLastName;
        this.doctorFirstName = doctorFirstName;
        this.doctorLastName = doctorLastName;
        this.apptType = apptType;
        this.reasonForVisit = reasonForVisit;
        this.insuranceProvider = insuranceProvider;
        this.insurancePlanNum = insurancePlanNum;
        this.notes = notes;
    }

    public Appointments() {
    }

    public int getApptID() {
        return apptID;
    }

    public void setApptID(int apptID) {
        this.apptID = apptID;
    }

    public LocalDate getApptDate() {
        return apptDate;
    }

    public void setApptDate(LocalDate apptDate) {
        this.apptDate = apptDate;
    }

    public LocalTime getApptTime() {
        return apptTime;
    }

    public void setApptTime(LocalTime apptTime) {
        this.apptTime = apptTime;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserFirstName() {
        return userFirstName;
    }

    public void setUserFirstName(String userFirstName) {
        this.userFirstName = userFirstName;
    }

    public String getUserLastName() {
        return userLastName;
    }

    public void setUserLastName(String userLastName) {
        this.userLastName = userLastName;
    }

    public String getDoctorFirstName() {
        return doctorFirstName;
    }

    public void setDoctorFirstName(String doctorFirstName) {
        this.doctorFirstName = doctorFirstName;
    }

    public String getDoctorLastName() {
        return doctorLastName;
    }

    public void setDoctorLastName(String doctorLastName) {
        this.doctorLastName = doctorLastName;
    }

    public int getApptType() {
        return apptType;
    }

    public void setApptType(int apptType) {
        this.apptType = apptType;
    }

    public String getReasonForVisit() {
        return reasonForVisit;
    }

    public void setReasonForVisit(String reasonForVisit) {
        this.reasonForVisit = reasonForVisit;
    }

    public String getInsuranceProvider() {
        return insuranceProvider;
    }

    public void setInsuranceProvider(String insuranceProvider) {
        this.insuranceProvider = insuranceProvider;
    }

    public String getInsurancePlanNum() {
        return insurancePlanNum;
    }

    public void setInsurancePlanNum(String insurancePlanNum) {
        this.insurancePlanNum = insurancePlanNum;
    }
    
    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }
}
