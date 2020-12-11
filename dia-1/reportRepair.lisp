(defparameter *lista* '())

(defun obtener-input (path)
  (mapcar #'parse-integer (uiop:read-file-lines path)))

(defun complemento (expensa) (- 2020 expensa))

(defun tenemosSuComplemento (expensa expensas)
  (find (complemento expensa) expensas))

(defun producto-de-expensas-buscadas (expensas)
  (let ((expensa-buscada (find-if (lambda (expensa) (tenemosSuComplemento expensa expensas)) expensas)))
    (* expensa-buscada (complemento expensa-buscada))))

(defun solucionarProblema (path)
  (producto-de-expensas-buscadas (obtener-input path)))
