(defparameter *lista* '())

(defun obtener-input (path)
  (with-open-file (archivo path)
    (print (read-line archivo))
    (loop :for linea = (read-line archivo nil))
          :do (print linea)))

(defun complemento (expensa) (- 2020 expensa))

(defun tenemosSuComplemento (expensa expensas)
  (find (complemento expensa) expensas))

(defun solucionarProblema (expensas)
  (let ((expensa-buscada (find-if (lambda (expensa) (tenemosSuComplemento expensa expensas)) expensas)))
    (* expensa-buscada (complemento expensa-buscada))))
