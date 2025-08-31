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
-- Name: product_assoc; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_assoc (
    product_id character varying(20) NOT NULL,
    product_id_to character varying(20) NOT NULL,
    product_assoc_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    sequence_num numeric(20,0),
    reason character varying(255),
    quantity numeric(18,6),
    scrap_factor numeric(18,6),
    instruction character varying(255),
    routing_work_effort_id character varying(20),
    estimate_calc_method character varying(20),
    recurrence_info_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_assoc OWNER TO ofbiz;

--
-- Name: product_assoc pk_product_assoc; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_assoc
    ADD CONSTRAINT pk_product_assoc PRIMARY KEY (product_id, product_id_to, product_assoc_type_id, from_date);


--
-- Name: prdct_assc_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdct_assc_txcrts ON product_assoc USING btree (created_tx_stamp);


--
-- Name: prdct_assc_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdct_assc_txstmp ON product_assoc USING btree (last_updated_tx_stamp);


--
-- Name: prod_assoc_aprod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_assoc_aprod ON product_assoc USING btree (product_id_to);


--
-- Name: prod_assoc_cusm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_assoc_cusm ON product_assoc USING btree (estimate_calc_method);


--
-- Name: prod_assoc_mprod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_assoc_mprod ON product_assoc USING btree (product_id);


--
-- Name: prod_assoc_recinfo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_assoc_recinfo ON product_assoc USING btree (recurrence_info_id);


--
-- Name: prod_assoc_rtwe; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_assoc_rtwe ON product_assoc USING btree (routing_work_effort_id);


--
-- Name: prod_assoc_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_assoc_type ON product_assoc USING btree (product_assoc_type_id);


--
-- Name: product_assoc prod_assoc_aprod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_assoc
    ADD CONSTRAINT prod_assoc_aprod FOREIGN KEY (product_id_to) REFERENCES product(product_id);


--
-- Name: product_assoc prod_assoc_cusm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_assoc
    ADD CONSTRAINT prod_assoc_cusm FOREIGN KEY (estimate_calc_method) REFERENCES custom_method(custom_method_id);


--
-- Name: product_assoc prod_assoc_mprod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_assoc
    ADD CONSTRAINT prod_assoc_mprod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: product_assoc prod_assoc_recinfo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_assoc
    ADD CONSTRAINT prod_assoc_recinfo FOREIGN KEY (recurrence_info_id) REFERENCES recurrence_info(recurrence_info_id);


--
-- Name: product_assoc prod_assoc_rtwe; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_assoc
    ADD CONSTRAINT prod_assoc_rtwe FOREIGN KEY (routing_work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- Name: product_assoc prod_assoc_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_assoc
    ADD CONSTRAINT prod_assoc_type FOREIGN KEY (product_assoc_type_id) REFERENCES product_assoc_type(product_assoc_type_id);


--
-- PostgreSQL database dump complete
--

