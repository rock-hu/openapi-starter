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
-- Name: product_maint; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_maint (
    product_id character varying(20) NOT NULL,
    product_maint_seq_id character varying(20) NOT NULL,
    product_maint_type_id character varying(20),
    maint_name character varying(100),
    maint_template_work_effort_id character varying(20),
    interval_quantity numeric(18,6),
    interval_uom_id character varying(20),
    interval_meter_type_id character varying(20),
    repeat_count numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_maint OWNER TO ofbiz;

--
-- Name: product_maint pk_product_maint; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_maint
    ADD CONSTRAINT pk_product_maint PRIMARY KEY (product_id, product_maint_seq_id);


--
-- Name: prdct_mnt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdct_mnt_txcrts ON product_maint USING btree (created_tx_stamp);


--
-- Name: prdct_mnt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdct_mnt_txstmp ON product_maint USING btree (last_updated_tx_stamp);


--
-- Name: prodmnt_intuom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prodmnt_intuom ON product_maint USING btree (interval_uom_id);


--
-- Name: prodmnt_mnttyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prodmnt_mnttyp ON product_maint USING btree (product_maint_type_id);


--
-- Name: prodmnt_pdmttyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prodmnt_pdmttyp ON product_maint USING btree (interval_meter_type_id);


--
-- Name: prodmnt_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prodmnt_prod ON product_maint USING btree (product_id);


--
-- Name: prodmnt_tplhwe; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prodmnt_tplhwe ON product_maint USING btree (maint_template_work_effort_id);


--
-- Name: product_maint prodmnt_intuom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_maint
    ADD CONSTRAINT prodmnt_intuom FOREIGN KEY (interval_uom_id) REFERENCES uom(uom_id);


--
-- Name: product_maint prodmnt_mnttyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_maint
    ADD CONSTRAINT prodmnt_mnttyp FOREIGN KEY (product_maint_type_id) REFERENCES product_maint_type(product_maint_type_id);


--
-- Name: product_maint prodmnt_pdmttyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_maint
    ADD CONSTRAINT prodmnt_pdmttyp FOREIGN KEY (interval_meter_type_id) REFERENCES product_meter_type(product_meter_type_id);


--
-- Name: product_maint prodmnt_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_maint
    ADD CONSTRAINT prodmnt_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: product_maint prodmnt_tplhwe; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_maint
    ADD CONSTRAINT prodmnt_tplhwe FOREIGN KEY (maint_template_work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

