(defun check_length2 ( point1 / total_distance counter first second)
	(setq total_distance 0)
	(setq counter 0)
	(while (< counter (- (length point1) 1))
		(setq first (nth counter point1))
		(setq second (nth (+ 1 counter) point1))
		(setq total_distance(+ (distance first second) total_distance))
		(setq counter (+ 1 counter))
	);while
	total_distance
);defun


(defun c:check_length ( / q i ttl points d edata data)
	(setq q(ssget));select
	(setq d 0)
	(setq ttl(sslength q));total length
	(setq i 0)
	(while (< i ttl)
		(setq points '())
		(setq edata(entget(ssname q i)))
		(foreach data edata
			(if (= 10 (car data))
				(setq points(cons (cdr data) points))
			);if
		);foreach
		(setq d(+ (check_length2 points) d))
		
		(setq i(+ 1 i))
	);while
	(princ d)
	(princ)
);