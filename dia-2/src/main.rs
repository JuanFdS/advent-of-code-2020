use std::str::FromStr;
use std::num::ParseIntError;

fn main() {
    println!("Hello, world!");
}

fn contrasenia_valida_segun_politica(minimo: i32, maximo: i32, letra: String, contrasenia: String) -> bool {
    let n = contrasenia.matches(&letra).count() as i32;
    return n >= minimo && n <= maximo
}

fn parsear_politica_y_contrasenia(input: String) -> (i32, i32, &'static str, String) {
    return (1, 3, "a", "abcde".to_string());
}

fn resolver_para(input: &str) -> i32 {
    let contrasenias_y_politicas : Vec<ContraseniaYPolitica> =  parsear_input(input).unwrap();
    return contrasenias_y_politicas.into_iter().
        filter(|contrasenia_y_politica| contrasenia_valida_segun_politica(contrasenia_y_politica.minimo,
            contrasenia_y_politica.maximo,
            contrasenia_y_politica.letra.to_string(),
            contrasenia_y_politica.contrasenia.to_string())).count() as i32;
}

#[derive(Debug, PartialEq)]
struct ContraseniaYPolitica {
    minimo: i32,
    maximo: i32,
    letra: String,
    contrasenia: String
}

fn parsear_input(input: &str) -> Result<Vec<ContraseniaYPolitica>, ParseIntError> {
    let c: Vec<&str> = input.split('\n').collect();
    return c.into_iter().map(|linea| linea.parse::<ContraseniaYPolitica>()).collect()
}

impl FromStr for ContraseniaYPolitica {
    type Err = ParseIntError;

    fn from_str(s: &str) -> Result<Self, Self::Err> {
        let splited_input: Vec<&str> = s.split(' ')
                                 .collect();

        let rango: Vec<&str>= splited_input[0].split('-').collect();
        let minimo = rango[0].parse::<i32>()?;
        let maximo = rango[1].parse::<i32>()?;
        let letra = splited_input[1].chars().nth(0).unwrap().to_string();
        let contrasenia = splited_input[2].to_string();
        Ok(ContraseniaYPolitica { minimo: minimo, maximo: maximo, letra: letra, contrasenia: contrasenia})
    }
}

#[cfg(test)]
mod tests {
    // Note this useful idiom: importing names from outer (for mod tests) scope.
    use super::*;

    #[test]
    fn foo() {
        assert!(contrasenia_valida_segun_politica(1, 1, "a".to_string(), "a".to_string()));
    }

    #[test]
    fn foo2() {
        assert!(!contrasenia_valida_segun_politica(1, 1, "a".to_string(), "b".to_string()));
    }

    #[test]
    fn contrasenia_no_es_valida_si_la_letra_pedida_aparece_menos_veces_que_el_minimo_de_la_politica() {
        assert!(!contrasenia_valida_segun_politica(2, 3, "a".to_string(), "a".to_string()));
    }

    #[test]
    fn contrasenia_no_es_valida_si_la_letra_pedida_aparece_mas_veces_que_el_maximo_de_la_politica() {
        assert!(!contrasenia_valida_segun_politica(1, 1, "a".to_string(), "aa".to_string()));
    }

    #[test]
    fn bleh() {
        assert!(contrasenia_valida_segun_politica(1, 3, "a".to_string(), "abcde".to_string()));
        assert!(!contrasenia_valida_segun_politica(1, 3, "b".to_string(), "cdefg".to_string()));
        assert!(contrasenia_valida_segun_politica(2, 9, "c".to_string(), "ccccccccc".to_string()));
    }

    #[test]
    fn bleh2() {
        assert_eq!("1-3 a: abcde".parse::<ContraseniaYPolitica>(),
                   Ok(ContraseniaYPolitica { minimo: 1, maximo: 3, letra: "a".to_string(), contrasenia: "abcde".to_string() }))
    }

    #[test]
    fn bleh3() {
        assert_eq!("1-3 b: cdefg".parse::<ContraseniaYPolitica>(),
                    Ok(ContraseniaYPolitica { minimo: 1, maximo: 3, letra: "b".to_string(), contrasenia: "cdefg".to_string() }))
    }

    #[test]
    fn bleh4() {
        let archivo = "1-3 a: abcde\n1-3 b: cdefg";
        assert_eq!(parsear_input(archivo),
        Ok(vec![ContraseniaYPolitica { minimo: 1, maximo: 3, letra: "a".to_string(), contrasenia: "abcde".to_string() },
        ContraseniaYPolitica { minimo: 1, maximo: 3, letra: "b".to_string(), contrasenia: "cdefg".to_string() }]))
    }

    #[test]
    fn bleh5() {
        let archivo = "1-3 a: abcde\n1-3 b: cdefg\n2-9 c: ccccccccc";
        assert_eq!(resolver_para(archivo), 2)
    }
}
