(defparameter *lista* (obtener-input "dia-1/input.txt"))

(defun obtener-input (path)
  (mapcar #'parse-integer (uiop:read-file-lines path)))

(defun complemento (expensa) (- 2020 expensa))

(defun tenemosSuComplemento (expensa expensas)
  (find (complemento expensa) expensas))

(defun tenemosSuComplementoDe (expensa total expensas)
  (find (- total expensa) expensas))

(defun encontrar-dos-que-sumen (total valores)
  (let ((primer-sumando (find-if (lambda (valor) (tenemosSuComplementoDe valor total valores)) valores)))
    (when primer-sumando
      (values primer-sumando (- total primer-sumando)))))

(defun encontrar-tres-que-sumen (total valores)
  (let ((primer-sumando (find-if (lambda (valor) (encontrar-dos-que-sumen (- total valor) valores)) valores)))
    (when primer-sumando
      (multiple-value-bind (uno dos) (encontrar-dos-que-sumen (- total primer-sumando) valores)
        (values uno dos primer-sumando)))))

(defun producto-de-expensas-buscadas (expensas)
  (let ((expensa-buscada (find-if (lambda (expensa) (tenemosSuComplemento expensa expensas)) expensas)))
    (* expensa-buscada (complemento expensa-buscada))))

(defun solucionarProblema (path)
  (producto-de-expensas-buscadas (obtener-input path)))
