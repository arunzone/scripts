# reoplave value with description attribute for @Schema
find . -type f -name "*.java" -print0 | xargs  -0 sed -i -E "s/\(@Schema.*\) value \= /\1description = /"

# replace response to content to al java file
sed -i -E "s/\(@ApiResponse.*\) response \= /\1content = @Content(schema = @Schema(implementation = ))/" /Users/arunparamasivam/workspace/waave-platform/src/main/java/com/waave/platform/client/assembly/api/ToolsApi.java

# replace response to content to all java files
find . -type f -name "*.java" -print0 | xargs  -0 sed -i -E "s/\(@ApiResponse.*\) response \= \(.*\.class\)/\1content = @Content(schema = @Schema(implementation = \2))/"

# replace ddefaultValues in all java files
sed -i -E "s/\(@Parameter.*\) defaultValue \= \(\"[^\"]*\)\") @/\1 content = @Content(schema = @Schema(type = \"string\", defaultValue = \2\"))) @/" /Users/arunparamasivam/workspace/waave-platform/src/main/java/com/waave/platform/client/assembly/api/BankAccountsApi.java

# replace ddefaultValues in all java files
find . -type f -name "*.java" -print0 | xargs  -0 sed -i -E "s/\(@Parameter.*\) defaultValue \= \(\"[^\"]*\)\") @/\1 content = @Content(schema = @Schema(type = \"string\", defaultValue = \2\"))) @/"
 
# Replace allowedValues
sed -i -E "s/\(@Parameter.*\) allowableValues \= \(\"[^\"]*\)\") @/\1 content = @Content(schema = @Schema(type = \"string\", allowableValues = \2\"))) @/" /Users/arunparamasivam/workspace/waave-platform/src/main/java/com/waave/platform/client/assembly/api/BatchTransactionsApi.java
