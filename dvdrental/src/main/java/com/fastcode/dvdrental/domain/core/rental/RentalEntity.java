package com.fastcode.dvdrental.domain.core.rental;

import com.fastcode.dvdrental.domain.core.abstractentity.AbstractEntity;
import com.fastcode.dvdrental.domain.core.customer.CustomerEntity;
import com.fastcode.dvdrental.domain.core.inventory.InventoryEntity;
import com.fastcode.dvdrental.domain.core.staff.StaffEntity;
import java.time.*;
import javax.persistence.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "RENTAL")
@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@NoArgsConstructor
public class RentalEntity extends AbstractEntity {

    @Basic
    @Column(name = "RENTAL_DATE", nullable = true)
    private LocalDate rentalDate;

    @Basic
    @Column(name = "RETURN_DATE", nullable = true)
    private LocalDate returnDate;

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "RENTAL_ID", nullable = false)
    private Integer rentalId;

    @ManyToOne
    @JoinColumn(name = "STAFF_ID")
    private StaffEntity staff;

    @ManyToOne
    @JoinColumn(name = "INVENTORY_ID")
    private InventoryEntity inventory;

    @ManyToOne
    @JoinColumn(name = "CUSTOMER_ID")
    private CustomerEntity customer;
}
