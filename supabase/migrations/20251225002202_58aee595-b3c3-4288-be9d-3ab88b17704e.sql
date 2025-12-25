-- Create customer_registrations table
CREATE TABLE public.customer_registrations (
  id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL,
  mobile TEXT NOT NULL,
  panchayath_id UUID REFERENCES public.panchayaths(id) ON DELETE SET NULL,
  ward_id UUID REFERENCES public.wards(id) ON DELETE SET NULL,
  place TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

-- Enable RLS
ALTER TABLE public.customer_registrations ENABLE ROW LEVEL SECURITY;

-- Create policies for public access
CREATE POLICY "Allow public read customer_registrations" 
ON public.customer_registrations 
FOR SELECT 
USING (true);

CREATE POLICY "Allow public insert customer_registrations" 
ON public.customer_registrations 
FOR INSERT 
WITH CHECK (true);

CREATE POLICY "Allow public update customer_registrations" 
ON public.customer_registrations 
FOR UPDATE 
USING (true);

CREATE POLICY "Allow public delete customer_registrations" 
ON public.customer_registrations 
FOR DELETE 
USING (true);

-- Create trigger for updated_at
CREATE TRIGGER update_customer_registrations_updated_at
BEFORE UPDATE ON public.customer_registrations
FOR EACH ROW
EXECUTE FUNCTION public.update_updated_at_column();