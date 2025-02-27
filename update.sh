README="README.md"
PASSWORDS="passwords.csv"

echo "Counting passwords..."
WORD_COUNT=$(($(cat $PASSWORDS | wc -l) - 1))

echo "Sorting passwords..."
cp ${PASSWORDS} ${PASSWORDS}2
cat ${PASSWORDS}2 | (sed -u 1q; sort -f) > $PASSWORDS
rm ${PASSWORDS}2

echo "Updating README.md"
sed -i -E "s/(Number of collected default passwords: \`\`).*(\`\`\. )/\1$(echo $WORD_COUNT)\2/" README.md

echo "done."
