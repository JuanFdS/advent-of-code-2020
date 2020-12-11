(defparameter *anio-del-mal* 2020)

(defun obtener-input (path)
  (mapcar #'parse-integer (uiop:read-file-lines path)))

(defun con-complemento (valor total valores)
  (let* ((valor-complemento (- total valor))
         (complemento (find valor-complemento valores)))
    (when complemento (list valor complemento))))

(defun encontrar-dos-que-sumen (total valores)
  (loop :for valor :in valores :when (con-complemento valor total valores) :return :it))

(defun encontrar-tres-que-sumen (total valores)
  (loop :for valor :in valores
        :for (sumando-1 sumando-2) := (encontrar-dos-que-sumen (- total valor) valores)
        :when sumando-1 :return (list sumando-1 sumando-2 valor)))

(defun producto-de (valores)
  (apply #'* valores))

(defun solucionar-problema-1 (path)
  (producto-de (encontrar-dos-que-sumen *anio-del-mal* (obtener-input path))))

(defun solucionar-problema-2 (path)
  (producto-de (encontrar-tres-que-sumen *anio-del-mal* (obtener-input path))))
