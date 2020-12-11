(defparameter *lista* '())

(defun obtener-input (path)
  (mapcar #'parse-integer (uiop:read-file-lines path)))

(defun complemento (expensa) (complemento-de expensa 2020))

(defun complemento-de (expensa total) (- total expensa))

(defun tenemosSuComplemento (expensa expensas)
  (find (complemento expensa) expensas))

(defun tenemosSuComplementoDe (expensa total expensas)
  (find-if (complemento-de expensa) expensas))

(defun tenemosSusComplementos (expensa expensas)
  (let ((complemento (complemento expensa expensas)))
    (find (complemento expensa) expensas)))

(defun producto-de-expensas-buscadas (expensas)
  (let ((expensa-buscada (find-if (lambda (expensa) (tenemosSuComplemento expensa expensas)) expensas)))
    (* expensa-buscada (complemento expensa-buscada))))

(defun solucionarProblema (path)
  (producto-de-expensas-buscadas (obtener-input path)))
