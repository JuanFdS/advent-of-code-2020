fn main() {
    println!("Hello, world!");
}

fn contrasenia_valida_segun_politica(minimo: i32, maximo: i32, letra: char, contrasenia: String) -> bool {
    return contrasenia.contains(letra)
}

#[cfg(test)]
mod tests {
    // Note this useful idiom: importing names from outer (for mod tests) scope.
    use super::*;

    #[test]
    fn foo() {
        assert!(contrasenia_valida_segun_politica(1, 1, 'a', "a".to_string()));
    }

    #[test]
    fn foo2() {
        assert!(!contrasenia_valida_segun_politica(1, 1, 'a', "b".to_string()));
    }
}
