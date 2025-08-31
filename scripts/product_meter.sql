--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: product_meter; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_meter (
    product_id character varying(20) NOT NULL,
    product_meter_type_id character varying(20) NOT NULL,
    meter_uom_id character varying(20),
    meter_name character varying(100),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_meter OWNER TO ofbiz;

--
-- Name: product_meter pk_product_meter; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_meter
    ADD CONSTRAINT pk_product_meter PRIMARY KEY (product_id, product_meter_type_id);


--
-- Name: prdct_mtr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdct_mtr_txcrts ON product_meter USING btree (created_tx_stamp);


--
-- Name: prdct_mtr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdct_mtr_txstmp ON product_meter USING btree (last_updated_tx_stamp);


--
-- Name: prodmtr_mtrtyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prodmtr_mtrtyp ON product_meter USING btree (product_meter_type_id);


--
-- Name: prodmtr_mtruom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prodmtr_mtruom ON product_meter USING btree (meter_uom_id);


--
-- Name: prodmtr_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prodmtr_prod ON product_meter USING btree (product_id);


--
-- Name: product_meter prodmtr_mtrtyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_meter
    ADD CONSTRAINT prodmtr_mtrtyp FOREIGN KEY (product_meter_type_id) REFERENCES product_meter_type(product_meter_type_id);


--
-- Name: product_meter prodmtr_mtruom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_meter
    ADD CONSTRAINT prodmtr_mtruom FOREIGN KEY (meter_uom_id) REFERENCES uom(uom_id);


--
-- Name: product_meter prodmtr_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_meter
    ADD CONSTRAINT prodmtr_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- PostgreSQL database dump complete
--

