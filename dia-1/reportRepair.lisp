(defparameter *lista* (obtener-input "dia-1/input.txt"))

(defun obtener-input (path)
  (mapcar #'parse-integer (uiop:read-file-lines path)))

(defun complemento (expensa) (complemento-de expensa 2020))

(defun complemento-de (expensa total) (- total expensa))

(defun tenemosSuComplemento (expensa expensas)
  (find (complemento expensa) expensas))

(defun tenemosSuComplementoDe (expensa total expensas)
  (find (complemento-de expensa total) expensas))

(defun foo (complemento-de-la-expensa expensas)
    (find-if (lambda (una-expensa) (tenemosSuComplementoDe una-expensa complemento-de-la-expensa expensas)) expensas))

(defun tenemosSusComplementos (expensa expensas)
  (let ((complemento-de-la-expensa (complemento expensa)))
        (foo complemento-de-la-expensa expensas)))

(defun producto-de-expensas-buscadas (expensas)
  (let ((expensa-buscada (find-if (lambda (expensa) (tenemosSuComplemento expensa expensas)) expensas)))
    (* expensa-buscada (complemento expensa-buscada))))

(defun solucionarProblema (path)
  (producto-de-expensas-buscadas (obtener-input path)))
