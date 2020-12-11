(defparameter *lista* (obtener-input "dia-1/input.txt"))
(defparameter *anioDelMal* 2020)

(defun obtener-input (path)
  (mapcar #'parse-integer (uiop:read-file-lines path)))

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

(defmacro product (form)
    `(multiple-value-call #'* ,form))

(defun solucionarProblema1 (path)
  (product (encontrar-dos-que-sumen *anioDelMal* (obtener-input path))))

(defun solucionarProblema2 (path)
  (product (encontrar-tres-que-sumen *anioDelMal* (obtener-input path))))
