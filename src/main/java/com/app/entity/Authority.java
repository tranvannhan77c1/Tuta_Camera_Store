package com.app.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Authorities", uniqueConstraints = {@UniqueConstraint(columnNames = {"AccountId", "RoleId"})})
public class Authority {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private int id;

    @ManyToOne
    @JoinColumn(name = "Accountid", nullable = false)
    private Account account;

    @ManyToOne
    @JoinColumn(name = "Roleid", nullable = false)
    private Role role;
}