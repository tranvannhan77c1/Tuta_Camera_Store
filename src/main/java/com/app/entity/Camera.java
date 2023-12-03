package com.app.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Cameras")
public class Camera {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private int id;

    @Column(name = "Name", unique = true, nullable = false)
    private String name;

    @ManyToOne
    @JoinColumn(name = "CategoryId", nullable = false)
    private Category category;

    @ManyToOne
    @JoinColumn(name = "BrandId", nullable = false)
    private Brand brand;

    @Column(name = "Price")
    private int price;

    @Column(name = "Quantity")
    private int quantity;

    @Column(name = "Introduce")
    private String introduce;

    @Column(name = "Description1")
    private String description1;

    @Column(name = "Description2")
    private String description2;

    @Column(name = "Width")
    private String width;

    @Column(name = "Height")
    private String height;

    @Column(name = "Depth")
    private String depth;

    @Column(name = "Weight")
    private String weight;

    @Column(name = "PrimaryImage")
    private String primaryImage;

    @Column(name = "AdditionalImage1")
    private String additionalImage1;

    @Column(name = "AdditionalImage2")
    private String additionalImage2;

    @Column(name = "AdditionalImage3")
    private String additionalImage3;
}