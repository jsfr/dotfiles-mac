# Defined in - @ line 0
function jooq --description 'alias jooq gradle generatePleoJooqSchemaSource --rerun-tasks'
	./gradlew generatePleoJooqSchemaSource --rerun-tasks $argv;
end
