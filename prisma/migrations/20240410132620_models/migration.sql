-- CreateTable
CREATE TABLE "Doctor" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "CPF" INTEGER NOT NULL,
    "CRM" INTEGER NOT NULL,
    "birthDay" TIMESTAMP(3) NOT NULL,
    "skill" TEXT NOT NULL,

    CONSTRAINT "Doctor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Appoiment" (
    "id" SERIAL NOT NULL,
    "doctorId" INTEGER NOT NULL,
    "patientId" INTEGER NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "time" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Appoiment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Patient" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "birthDay" TIMESTAMP(3) NOT NULL,
    "CPF" INTEGER NOT NULL,
    "RG" INTEGER NOT NULL,
    "CEP" INTEGER NOT NULL,
    "numberHouse" INTEGER NOT NULL,
    "street" TEXT NOT NULL,
    "neighbourhood" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "telephone" INTEGER NOT NULL,

    CONSTRAINT "Patient_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Doctor_CPF_key" ON "Doctor"("CPF");

-- CreateIndex
CREATE UNIQUE INDEX "Doctor_CRM_key" ON "Doctor"("CRM");

-- CreateIndex
CREATE UNIQUE INDEX "Patient_CPF_key" ON "Patient"("CPF");

-- CreateIndex
CREATE UNIQUE INDEX "Patient_RG_key" ON "Patient"("RG");

-- CreateIndex
CREATE UNIQUE INDEX "Patient_telephone_key" ON "Patient"("telephone");

-- AddForeignKey
ALTER TABLE "Appoiment" ADD CONSTRAINT "Appoiment_doctorId_fkey" FOREIGN KEY ("doctorId") REFERENCES "Doctor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Appoiment" ADD CONSTRAINT "Appoiment_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
