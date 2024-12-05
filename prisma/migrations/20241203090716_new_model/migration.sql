-- CreateEnum
CREATE TYPE "Unit" AS ENUM ('PIECE', 'GRAM');

-- CreateTable
CREATE TABLE "Documents" (
    "id" SERIAL NOT NULL,
    "documentNumber" TEXT NOT NULL,
    "issueDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dueDate" TIMESTAMP(3) NOT NULL,
    "customerName" TEXT NOT NULL,
    "billingAddress" TEXT NOT NULL,
    "shippingAddress" TEXT NOT NULL,
    "referenceNumber" TEXT,
    "currency" TEXT NOT NULL,
    "remark" TEXT,

    CONSTRAINT "Documents_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Document_Items" (
    "id" SERIAL NOT NULL,
    "documentId" INTEGER NOT NULL,
    "productCode" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL,
    "weight" DOUBLE PRECISION NOT NULL,
    "unitPrice" DOUBLE PRECISION NOT NULL,
    "unit" "Unit" NOT NULL,
    "priceBeforeDiscount" DOUBLE PRECISION NOT NULL,
    "discountRate" DOUBLE PRECISION NOT NULL,
    "netPrice" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "Document_Items_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Document_Summary" (
    "id" SERIAL NOT NULL,
    "documentId" INTEGER NOT NULL,
    "subtotal" DOUBLE PRECISION NOT NULL,
    "discountTotal" DOUBLE PRECISION NOT NULL,
    "netTotal" DOUBLE PRECISION NOT NULL,
    "vat" DOUBLE PRECISION NOT NULL,
    "grandTotal" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "Document_Summary_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Documents_documentNumber_key" ON "Documents"("documentNumber");

-- CreateIndex
CREATE UNIQUE INDEX "Document_Summary_documentId_key" ON "Document_Summary"("documentId");

-- AddForeignKey
ALTER TABLE "Document_Items" ADD CONSTRAINT "Document_Items_documentId_fkey" FOREIGN KEY ("documentId") REFERENCES "Documents"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Document_Summary" ADD CONSTRAINT "Document_Summary_documentId_fkey" FOREIGN KEY ("documentId") REFERENCES "Documents"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
