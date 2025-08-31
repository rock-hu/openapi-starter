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
-- Name: product_group_order; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_group_order (
    group_order_id character varying(20) NOT NULL,
    product_id character varying(20),
    from_date timestamp with time zone,
    thru_date timestamp with time zone,
    status_id character varying(20),
    req_order_qty numeric(18,6),
    sold_order_qty numeric(18,6),
    job_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_group_order OWNER TO ofbiz;

--
-- Name: product_group_order pk_product_group_order; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_group_order
    ADD CONSTRAINT pk_product_group_order PRIMARY KEY (group_order_id);


--
-- Name: group_order_job; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX group_order_job ON product_group_order USING btree (job_id);


--
-- Name: group_order_status; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX group_order_status ON product_group_order USING btree (status_id);


--
-- Name: prdt_grp_orr_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_grp_orr_txcrs ON product_group_order USING btree (created_tx_stamp);


--
-- Name: prdt_grp_orr_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_grp_orr_txstp ON product_group_order USING btree (last_updated_tx_stamp);


--
-- Name: prod_group_order; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_group_order ON product_group_order USING btree (product_id);


--
-- Name: product_group_order group_order_job; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_group_order
    ADD CONSTRAINT group_order_job FOREIGN KEY (job_id) REFERENCES job_sandbox(job_id);


--
-- Name: product_group_order group_order_status; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_group_order
    ADD CONSTRAINT group_order_status FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: product_group_order prod_group_order; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_group_order
    ADD CONSTRAINT prod_group_order FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- PostgreSQL database dump complete
--

