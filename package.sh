name=${1}
dockerlib="dockerlib"

# if exist
if [[ ! (-f ${name}) ]]
then
  echo "error not file: ${name}"
  exit
fi

rm ./${dockerlib} -rf
mkdir ${dockerlib}

# start
echo "start: ${name}"

cp ${name} ./${dockerlib}

function p()
{
  echo "cp $(readlink -f ${1} ) ./${dockerlib}/$(basename ${1} )"
  cp $(readlink -f ${1} ) ./${dockerlib}/$(basename ${1} )
  return 
}


files=`ldd ${name} | awk '{print $3}'`

for file in ${files} 
do
  if [[ ! (-e ${file}) ]]
  then
      continue
  fi

  w1=`ls -al ${file} | awk '{print $9}'`
  p ${w1}

done

# end
echo "success"

