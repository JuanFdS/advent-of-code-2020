(defparameter *lista-de-prueba* '(1721 979 366 299 675 1456))

(defun obtener-input (path)
  (with-open-file (archivo path)
    (read-line archivo)
    (read-line archivo)))

(defun complemento (expensa) (- 2020 expensa))

(defun tenemosSuComplemento (expensa expensas)
  (find (complemento expensa) expensas))

(defun solucionarProblema (expensas)
  (let ((expensa-buscada (find-if (lambda (expensa) (tenemosSuComplemento expensa expensas)) expensas)))
    (* expensa-buscada (complemento expensa-buscada))))
