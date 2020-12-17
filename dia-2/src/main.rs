fn main() {
    println!("Hello, world!");
}

fn contrasenia_valida_segun_politica(minimo: i32, maximo: i32, letra: &str, contrasenia: String) -> bool {
    let n = contrasenia.matches(letra).count() as i32;
    return n >= minimo && n <= maximo
}

#[cfg(test)]
mod tests {
    // Note this useful idiom: importing names from outer (for mod tests) scope.
    use super::*;

    #[test]
    fn foo() {
        assert!(contrasenia_valida_segun_politica(1, 1, "a", "a".to_string()));
    }

    #[test]
    fn foo2() {
        assert!(!contrasenia_valida_segun_politica(1, 1, "a", "b".to_string()));
    }

    #[test]
    fn contrasenia_no_es_valida_si_la_letra_pedida_aparece_menos_veces_que_el_minimo_de_la_politica() {
        assert!(!contrasenia_valida_segun_politica(2, 3, "a", "a".to_string()));
    }

    #[test]
    fn contrasenia_no_es_valida_si_la_letra_pedida_aparece_mas_veces_que_el_maximo_de_la_politica() {
        assert!(!contrasenia_valida_segun_politica(1, 1, "a", "aa".to_string()));
    }

}
