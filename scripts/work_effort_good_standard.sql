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
-- Name: work_effort_good_standard; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE work_effort_good_standard (
    work_effort_id character varying(20) NOT NULL,
    product_id character varying(20) NOT NULL,
    work_effort_good_std_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    status_id character varying(20),
    estimated_quantity double precision,
    estimated_cost numeric(18,2),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.work_effort_good_standard OWNER TO ofbiz;

--
-- Name: work_effort_good_standard pk_work_effort_good_standard; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_good_standard
    ADD CONSTRAINT pk_work_effort_good_standard PRIMARY KEY (work_effort_id, product_id, work_effort_good_std_type_id, from_date);


--
-- Name: wkeff_gdstd_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_gdstd_prod ON work_effort_good_standard USING btree (product_id);


--
-- Name: wkeff_gdstd_stts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_gdstd_stts ON work_effort_good_standard USING btree (status_id);


--
-- Name: wkeff_gdstd_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_gdstd_type ON work_effort_good_standard USING btree (work_effort_good_std_type_id);


--
-- Name: wkeff_gdstd_weff; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_gdstd_weff ON work_effort_good_standard USING btree (work_effort_id);


--
-- Name: wrk_eft_gd_std_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_eft_gd_std_txp ON work_effort_good_standard USING btree (last_updated_tx_stamp);


--
-- Name: wrk_eft_gd_std_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_eft_gd_std_txs ON work_effort_good_standard USING btree (created_tx_stamp);


--
-- Name: work_effort_good_standard wkeff_gdstd_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_good_standard
    ADD CONSTRAINT wkeff_gdstd_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: work_effort_good_standard wkeff_gdstd_stts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_good_standard
    ADD CONSTRAINT wkeff_gdstd_stts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: work_effort_good_standard wkeff_gdstd_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_good_standard
    ADD CONSTRAINT wkeff_gdstd_type FOREIGN KEY (work_effort_good_std_type_id) REFERENCES work_effort_good_standard_type(work_effort_good_std_type_id);


--
-- Name: work_effort_good_standard wkeff_gdstd_weff; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_good_standard
    ADD CONSTRAINT wkeff_gdstd_weff FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

