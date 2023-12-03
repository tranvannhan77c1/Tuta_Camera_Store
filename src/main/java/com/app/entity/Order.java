package com.app.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private int id;

    @ManyToOne
    @JoinColumn(name = "AccountId", nullable = false)
    private Account account;

    @Column(name = "OrderDate")
    @Temporal(TemporalType.DATE)
    private Date orderDate;

    @Column(name = "TotalOrderAmount")
    private int totalOrderAmount;

    @Column(name = "PaymentMethod")
    private boolean paymentMethod = false;
    //Cách khác
    /*(columnDefinition = "BIT DEFAULT 0")
    @ColumnDefault("0")*/

    @Column(name = "Province")
    private String province;

    @Column(name = "District")
    private String district;

    @Column(name = "Commune")
    private String commune;

    @Column(name = "SpecificAddress")
    private String specificAddress;

    @Column(name = "Email")
    private String email;

    @Column(name = "Firstname")
    private String firstname;

    @Column(name = "Lastname")
    private String lastname;

    @Column(name = "Phone")
    private String phone;

    @JsonIgnore
    @OneToMany(mappedBy = "order")
    private List<OrderDetail> orderDetails;

    @PrePersist
    protected void onCreate() {
        this.orderDate = new Date();
    }

}