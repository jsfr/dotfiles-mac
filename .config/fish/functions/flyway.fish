# Defined in - @ line 0
function flyway --description 'alias flyway gradle flywayMigrate'
	./gradlew flywayMigrate $argv;
end
