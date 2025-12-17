-- Add remarks column to billing_transactions
ALTER TABLE public.billing_transactions 
ADD COLUMN remarks text;