package com.fastcode.dvdrental.domain.core.language;

import com.fastcode.dvdrental.domain.core.abstractentity.AbstractEntity;
import java.time.*;
import javax.persistence.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "LANGUAGE")
@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@NoArgsConstructor
public class LanguageEntity extends AbstractEntity {

    @Id
    @EqualsAndHashCode.Include
    @Column(name = "LANGUAGE_ID", nullable = false)
    private Integer languageId;

    @Basic
    @Column(name = "name", nullable = false, length = 20)
    private String name;
}
