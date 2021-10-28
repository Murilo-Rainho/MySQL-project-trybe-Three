USE SpotifyClone;

DELIMITER $$;

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON usuarios
FOR EACH ROW
BEGIN
	DELETE FROM usuarios_artistas ua
    WHERE OLD.usuario_id = ua.usuario_id;
    DELETE FROM historico_de_reproducoes hr
    WHERE OLD.usuario_id = hr.usuario_id;
END $$;

DELIMITER ;
