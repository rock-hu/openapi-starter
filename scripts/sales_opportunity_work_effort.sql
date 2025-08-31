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
-- Name: sales_opportunity_work_effort; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE sales_opportunity_work_effort (
    sales_opportunity_id character varying(20) NOT NULL,
    work_effort_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.sales_opportunity_work_effort OWNER TO ofbiz;

--
-- Name: sales_opportunity_work_effort pk_sales_opportunity_work_effo; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_opportunity_work_effort
    ADD CONSTRAINT pk_sales_opportunity_work_effo PRIMARY KEY (sales_opportunity_id, work_effort_id);


--
-- Name: sls_opt_wrk_eft_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sls_opt_wrk_eft_tp ON sales_opportunity_work_effort USING btree (last_updated_tx_stamp);


--
-- Name: sls_opt_wrk_eft_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sls_opt_wrk_eft_ts ON sales_opportunity_work_effort USING btree (created_tx_stamp);


--
-- Name: soppweff_sopp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX soppweff_sopp ON sales_opportunity_work_effort USING btree (sales_opportunity_id);


--
-- Name: soppweff_weff; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX soppweff_weff ON sales_opportunity_work_effort USING btree (work_effort_id);


--
-- Name: sales_opportunity_work_effort soppweff_sopp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_opportunity_work_effort
    ADD CONSTRAINT soppweff_sopp FOREIGN KEY (sales_opportunity_id) REFERENCES sales_opportunity(sales_opportunity_id);


--
-- Name: sales_opportunity_work_effort soppweff_weff; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_opportunity_work_effort
    ADD CONSTRAINT soppweff_weff FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

